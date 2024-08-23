

const video = document.getElementById('video');
const overlay = document.getElementById('overlay');
let lastPostion = '';

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
async function onPlay() {
    const displaySize = { width: video.videoWidth, height: video.videoHeight };
    faceapi.matchDimensions(overlay, displaySize);

    const context = overlay.getContext('2d');
    context.setTransform(-1, 0, 0, 1, overlay.width, 0); // Mirror effect

    let choices = [];
    let lastPosition = '';
    let choiceIndex = 0;
    let redirectUrl = '';

    function checkAndUpdatePosition(noseX) {
        let newPosition = '';
        if (noseX < overlay.width / 3) {
            newPosition = 'left';
        } else if (noseX >= overlay.width / 3 && noseX < (2 * overlay.width) / 3) {
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
        if (choiceIndex < 3) {
            setTimeout(() => {
                if (choices.length <= choiceIndex) {
                    choices.push(lastPosition);
                    console.log(`Choice ${choiceIndex + 1}: ${lastPosition}`);
                    choiceIndex++;
                    startChoosing();
                }
            }, 3000);
        } else {
            evaluateChoices();
        }
    }

    function evaluateChoices() {
        const [firstChoice, secondChoice, thirdChoice] = choices;
        if (firstChoice === 'middle' && secondChoice === 'right' && thirdChoice === 'left') {
            redirectUrl = '/result/correct';
        } else {
            redirectUrl = '/result/wrong';
        }
        window.location.href = redirectUrl;
    }

    startChoosing();

    setInterval(async () => {
        if (video.paused || video.ended) {
            return;
        }

        const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks();
        const resizedDetections = faceapi.resizeResults(detections, displaySize);

        context.clearRect(0, 0, overlay.width, overlay.height);

        faceapi.draw.drawFaceLandmarks(overlay, resizedDetections);

        context.strokeStyle = 'red';
        context.beginPath();
        context.moveTo(overlay.width / 3, 0);
        context.lineTo(overlay.width / 3, overlay.height);
        context.stroke();

        if (resizedDetections.length > 0) {
            const landmarks = resizedDetections[0].landmarks;
            const nose = landmarks.getNose();
            const noseX = overlay.width - nose[3].x; // Mirror effect adjustment

            const position = checkAndUpdatePosition(noseX);
            if (position) {
                lastPosition = position;
            }
        }
    }, 100);
}


// function sendAnswer(answer) {
//     const urlParams = new URLSearchParams(window.location.search);
//     const level = urlParams.get('level');
//     const number = urlParams.get('number');
//
//     fetch("/face/grading", {
//         method: "POST",
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify({ answer: answer, level: level, number: number })
//     })
//         .then(response => response.json())
//         .then(data => {
//             /**
//              * 정답일 때 correct 부분에 number를 쿼리파라미터로 넣기
//              * @type {string}
//              */
//             const resultUrl = data.correct ? '/result/correct' : '/result/wrong';
//             window.location.href = resultUrl;
//         })
//         .catch(error => {
//             console.log('Error: ', error);
//         });
// }
