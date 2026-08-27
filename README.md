# Real-time-Fitness-form-analyzer
turn on the webcam, analyses on what to do and guides how to reduce fat
# Fitness Form Analyzer
 
Real-time fitness form analysis system, built in phases. This repo currently
contains **Phase 1** only.
 
## Phase 1 — Real-Time Video Capture & Performance Monitoring
 
Phase 1 validates the core video pipeline before any AI/pose-estimation logic
is added. It:
 
- Opens the default webcam
- Displays the live camera feed in a window
- Calculates real-time FPS using a rolling/averaged window (smooth, non-jittery)
- Calculates per-frame processing latency in milliseconds
- Displays FPS, latency, and current resolution as an on-screen overlay
- Detects and reports webcam open/read failures instead of crashing
- Exits cleanly on `q`, releasing the camera and destroying windows
No MediaPipe, YOLO, or any AI model is used in this phase.
 
## Requirements
 
- Python 3.8+
- A connected, working webcam
- Dependency: `opencv-python` (see `phase1/requirements.txt`)
## Installation
 
```bash
cd fitness-form-analyzer/phase1
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```
 
## How to Run
 
```bash
python webcam_test.py
```
 
## Expected Output
 
A window titled **"Fitness Form Analyzer - Phase 1"** opens showing your
live webcam feed with an overlay in the top-left corner:
 
```
FPS: 29.7
Latency: 33.2 ms
Resolution: 1280x720
```
 
Press `q` while the window is focused to exit. The console will print
status messages on startup, on any errors, and on clean shutdown.
 
## Troubleshooting
 
**Webcam window doesn't open / script exits immediately with an error:**
 
- Make sure no other application (Zoom, Teams, another Python script, etc.)
  is currently using the webcam.
- Check Windows camera privacy settings: `Settings > Privacy & security >
  Camera` and ensure desktop apps are allowed access.
- If you have multiple cameras, try changing `CAMERA_INDEX` in
  `webcam_test.py` from `0` to `1` or `2`.
- Reconnect the webcam (if external/USB) and try again.
- Confirm OpenCV installed correctly: `python -c "import cv2; print(cv2.__version__)"`.
**Feed opens but is very slow / low FPS:**
 
- Lower resolution webcams or older USB ports (USB 2.0 vs 3.0) can limit FPS.
- Close other apps competing for CPU or camera bandwidth.
- This is expected to vary by hardware — Phase 1 has no heavy processing yet,
  so FPS here is close to your camera and system's baseline.
  
