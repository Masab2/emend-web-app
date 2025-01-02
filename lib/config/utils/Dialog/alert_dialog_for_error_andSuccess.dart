import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class CustomDialogs {
  static void showSuccessDialog(
    BuildContext context, {
    required String message,
    VoidCallback? onConfirm,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          width: context.mw * 0.35,
          child: Material(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: EdgeInsets.all(context.mh * 0.035),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.all(context.mh * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle_outline_rounded,
                          size: context.mh * 0.06,
                          color: Colors.green.shade600,
                        ),
                      ),
                      Positioned(
                        right: -context.mw * 0.02,
                        top: -context.mh * 0.02,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close_rounded,
                            size: context.mh * 0.025,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mh * 0.025),
                  Text(
                    'Success!',
                    style: TextStyle(
                      fontSize: context.mh * 0.028,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: context.mh * 0.015),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: context.mh * 0.03),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: double.infinity,
                      height: context.mh * 0.055,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (onConfirm != null) onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void showErrorDialog(
    BuildContext context, {
    required String message,
    VoidCallback? onRetry,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          width: context.mw * 0.35,
          child: Material(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: EdgeInsets.all(context.mh * 0.035),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.all(context.mh * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.error_outline_rounded,
                          size: context.mh * 0.06,
                          color: Colors.red.shade600,
                        ),
                      ),
                      Positioned(
                        right: -context.mw * 0.02,
                        top: -context.mh * 0.02,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close_rounded,
                            size: context.mh * 0.025,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.mh * 0.025),
                  Text(
                    'Oops!',
                    style: TextStyle(
                      fontSize: context.mh * 0.028,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: context.mh * 0.015),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: context.mh * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            height: context.mh * 0.055,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: context.mw * 0.015),
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            height: context.mh * 0.055,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                if (onRetry != null) onRetry();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Retry',
                                style: TextStyle(
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}