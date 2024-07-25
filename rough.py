# make sure that surfe.be is open and its google chrome extension is installed

import pyautogui as pg
import pytesseract as pt
pt.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseeract-OCR\tesseract.exe'
import time as tt

def captchaFound():
    screenshot = pg.screenshot()
    text = pt.image_to_string(screenshot)
    while "Visit complete" not in text:
        tt.sleep(5)
        screenshot = pg.screenshot()
        text = pt.image_to_string(screenshot)

def checkScreenshot(text1):
    screenshot = pg.screenshot()
    text = pt.image_to_string(screenshot)
    while text1 in text:
        tt.sleep(5)
        screenshot = pg.screenshot()
        text = pt.image_to_string(screenshot)

tt.sleep(5)
# click on extension icon
pg.moveTo(1148, 59)  # move mouse to extension icon
tt.sleep(1)
pg.click()
tt.sleep(4)

checkScreenshot("Solve")

# click on start button
pg.moveTo(1062, 279)  # move mouse to start button
tt.sleep(1)
pg.click()
tt.sleep(5)

checkScreenshot("Page loading")

checkScreenshot("Stay on this")

captchaFound()

checkScreenshot("Visit complete")

tt.sleep(3)

pg.hotkey('ctrl', 'w')



