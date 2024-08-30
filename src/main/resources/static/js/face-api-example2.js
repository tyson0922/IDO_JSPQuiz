

const video = document.getElementById('video');
const overlay = document.getElementById('overlay');
// let lastPosition = '';

Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('/static/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('/static/models')
]).then(startVideo);

function startVideo() {
    navigator.mediaDevices.getUserMedia({video: {}})
        .then(stream => {
            video.srcObject = stream;
            video.style.transform = "scaleX(-1)"; //좌우 반전(거울 효과)
            video.addEventListener('loadeddata', () => {
                video.play();
                // onPlay();
                setTimeout(onPlay, 8000);
            });
        })
        .catch(err => console.error(err));
}

async function initialize() {
    await loadModels();
    startVideo();
    setTimeout(() => {
        document.getElementById('mainHeading').textContent = '문장을 완성해보아요!';
        setTimeout(() => {
            document.getElementById('mainHeading').textContent = '단어 앞으로 이동해요!';
            document.getElementById('wordsContainer').style.opacity = '1';
            document.getElementById('video').style.opacity = '0.5';
            let countdown = 5;
            const countdownInterval = setInterval(() => {
                countdown--;
                document.getElementById('countdown').textContent = countdown;
                if (countdown === 0) {
                    clearInterval(countdownInterval);
                    checkUserPosition();
                }
            }, 1000);
        }, 3500);
    }, 0);
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
    let choiceLocked = false; // New variable to lock the choice after selection

    function checkAndUpdatePosition(noseX) {
        if (choiceLocked) return; // Do not update position if choice is locked

        let newPosition = '';
        const thirdWidth = overlay.width / 3;
        if (noseX < thirdWidth) {
            newPosition = 'left';
        } else if (noseX >= thirdWidth && noseX < 2 * thirdWidth) {
            newPosition = 'middle';
        } else {
            newPosition = 'right';
        }

        if (newPosition !== lastPosition) {
            lastPosition = newPosition;
            return newPosition;
        }
        return null;
    }

    function startChoosing() {
        if (choiceIndex === 0) {
            setTimeout(() => {
                const choice = lastPosition || 'middle';
                choices.push(choice); // Default to 'middle' if lastPosition is not set
                document.getElementById('choice1').textContent = choice; // Display the first choice
                console.log(`Choice ${choiceIndex + 1}: ${lastPosition}`);
                choiceLocked = true; // Lock the choice after selection
                choiceIndex++;
                setTimeout(() => {
                    choiceLocked = false; // Unlock for the next choice
                    startChoosing();
                }, 1000); // Short delay before unlocking for the next choice
            }, 3000);
        } else if (choiceIndex < 3) {
            setTimeout(() => {
                const choice = lastPosition;
                choices.push(choice);
                document.getElementById(`choice${choiceIndex + 1}`).textContent = choice; // Display the choice
                console.log(`Choice ${choiceIndex + 1}: ${lastPosition}`);
                choiceLocked = true; // Lock the choice after selection
                choiceIndex++;
                setTimeout(() => {
                    choiceLocked = false; // Unlock for the next choice
                    startChoosing();
                }, 1000); // Short delay before unlocking for the next choice
            }, 3000);
        } else {
            evaluateChoices();
        }
    }

    function evaluateChoices() {
        const [firstChoice, secondChoice, thirdChoice] = choices;
        if (firstChoice === 'middle' && secondChoice === 'right' && thirdChoice === 'left') {
            redirectUrl = '/result/correct100';
        } else {
            redirectUrl = '/result/wrong';
        }

        // Add a 1-second delay before redirecting
        setTimeout(() => {
            window.location.href = redirectUrl;
        }, 1000); // 1000 milliseconds = 1 second
    }

    startChoosing();  // Start the sequence for detecting choices

    async function detectFace() {
        if (video.paused || video.ended) {
            return;
        }

        const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();
        const resizedDetections = faceapi.resizeResults(detections, displaySize);

        context.clearRect(0, 0, overlay.width, overlay.height);

        // // Draw dividing lines
        // context.beginPath();
        // context.moveTo(overlay.width / 3, 0);
        // context.lineTo(overlay.width / 3, overlay.height);
        // context.moveTo((2 * overlay.width) / 3, 0);
        // context.lineTo((2 * overlay.width) / 3, overlay.height);
        // context.stroke();

        if (resizedDetections.length > 0) {
            const landmarks = resizedDetections[0].landmarks;
            const nose = landmarks.getNose();
            const noseX = overlay.width - nose[3].x; // Mirror effect adjustment

            checkAndUpdatePosition(noseX); // Only update position if not locked
        }

        // Trigger the next detection after a delay (e.g., 2 seconds)
        setTimeout(detectFace, 3000);
    }

    // Start the face detection process
    detectFace();
}