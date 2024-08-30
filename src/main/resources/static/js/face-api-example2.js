const initialImage = document.getElementById('initialImage');
const video = document.getElementById('video');
const overlay = document.getElementById('overlay');
const countdown = document.getElementById('countdown');

// Load face-api models
Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('/static/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('/static/models')
]).then(() => {
    // Display the image first, then hide it after 3 seconds and start the video
    setTimeout(() => {
        // Hide the image
        initialImage.style.display = 'none';

        // Show the video and canvas
        video.style.display = 'block';
        overlay.style.display = 'block';
        countdown.style.display = 'block';

        // Start the video stream
        startVideo();
    }, 3000); // 3-second delay before hiding the image and showing the video
});

function startVideo() {
    navigator.mediaDevices.getUserMedia({ video: {} })
        .then(stream => {
            video.srcObject = stream;
            video.style.transform = "scaleX(-1)"; // Mirror effect for the video
            video.addEventListener('loadeddata', () => {
                video.play();
                // Call onPlay after 4 seconds
                setTimeout(onPlay, 4000);
            });
        })
        .catch(err => console.error('Error accessing the camera: ', err));
}

async function onPlay() {
    const displaySize = { width: video.videoWidth, height: video.videoHeight };
    faceapi.matchDimensions(overlay, displaySize);

    const context = overlay.getContext('2d');
    context.setTransform(-1, 0, 0, 1, overlay.width, 0); // Mirror effect

    let choices = [];
    let lastPosition = '';
    let choiceIndex = 0;
    let redirectUrl = '';
    let choiceLocked = false;

    function checkAndUpdatePosition(noseX) {
        if (choiceLocked) return;

        let newPosition = '';
        const thirdWidth = overlay.width / 3;
        if (noseX < thirdWidth) {
            newPosition = '되었어요';
        } else if (noseX >= thirdWidth && noseX < 2 * thirdWidth) {
            newPosition = '아우는';
        } else {
            newPosition = '부자가';
        }

        if (newPosition !== lastPosition) {
            lastPosition = newPosition;
            return newPosition;
        }
        return null;
    }
    function startChoosing() {
        if (choiceIndex < 3) {
            setTimeout(() => {
                const choice = lastPosition || '아우는';  // Use current lastPosition as the choice
                choices[choiceIndex] = choice;  // Store the choice in the choices array
                document.getElementById(`choice${choiceIndex + 1}`).textContent = choice;
                console.log(`Choice ${choiceIndex + 1}: ${choice}`);
                choiceLocked = true;  // Lock the choice after selection
                choiceIndex++;

                setTimeout(() => {
                    choiceLocked = false;  // Unlock for the next choice
                    if (choiceIndex < 3) {
                        startChoosing();  // Start choosing the next word
                    } else {
                        evaluateChoices();  // Evaluate after the last choice
                    }
                }, 1000);  // Short delay before unlocking for the next choice
            }, 3000);  // Delay before recording the choice
        }
    }
    function evaluateChoices() {
        const [firstChoice, secondChoice, thirdChoice] = choices;
        if (firstChoice === '아우는' && secondChoice === '부자가' && thirdChoice === '되었어요') {
            redirectUrl = '/result/correct100';
        } else {
            redirectUrl = '/result/wrong';
        }

        setTimeout(() => {
            window.location.href = redirectUrl;
        }, 1000);
    }

    startChoosing();

    async function detectFace() {
        if (video.paused || video.ended) {
            return;
        }

        const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();
        const resizedDetections = faceapi.resizeResults(detections, displaySize);

        context.clearRect(0, 0, overlay.width, overlay.height);

        if (resizedDetections.length > 0) {
            const landmarks = resizedDetections[0].landmarks;
            const nose = landmarks.getNose();
            const noseX = overlay.width - nose[3].x;

            checkAndUpdatePosition(noseX);
        }

        setTimeout(detectFace, 2000);
    }

    detectFace();
}
