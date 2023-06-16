import cv2
import pyttsx3

# Initialize text-to-speech engine
engine = pyttsx3.init()

# Define text to be spoken
text = "Hello, how are you doing today?"

# Set speech rate
rate = engine.getProperty('rate')
engine.setProperty('rate', rate-50)

# Speak the text
engine.say(text)
engine.runAndWait()

# Load avatar image
avatar = cv2.imread('Users/DELL/Desktop/scarlet.png')

# Resize avatar image to fit the text
(h, w, _) = avatar.shape
ratio = w/h
new_height = 200
new_width = int(new_height * ratio)
avatar = cv2.resize(avatar, (new_width, new_height))

# Display avatar image with text
cv2.putText(avatar, text, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
cv2.imshow("Avatar", avatar)
cv2.waitKey(0)