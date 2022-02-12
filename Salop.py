import cv2


cap = cv2.VideoCapture(0)

ok_flag = True

while ok_flag:
    (ok_flag, img) = cap.read()

    if not ok_flag:
        break

    cv2.imshow("CallingCamera View", img)
    key=cv2.waitKey(0)
    if key in [27, ord('q'), ord('Q')]:
        ok_flag = False
        break  

cv2.destroyAllWindows()
