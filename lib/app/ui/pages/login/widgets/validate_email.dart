import 'package:dyshez_test/app/ui/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors_theme.dart';

class ValidateEmailPage extends StatelessWidget {
  const ValidateEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: secondaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 64,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Te hemos enviado un\ncódigo de verificación',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                      child: Text(
                        'Hemos enviado un codigo de verificación a tu email, por favor verifícalo e ingresalo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        enablePinAutofill: false,
                        errorTextSpace: 16,
                        showCursor: true,
                        cursorColor: primary,
                        obscureText: false,
                        hintCharacter: '-',
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 50,
                          fieldWidth: 40,
                          borderWidth: 2,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: black,
                          inactiveColor: alternate,
                          selectedColor: primary,
                          activeFillColor: black,
                          inactiveFillColor: alternate,
                          selectedFillColor: primary,
                        ),
                        controller: controller.pinCodeController,
                        onCompleted: (value) {},
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 92,
                      decoration: BoxDecoration(
                        color: secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE3E3E3),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/Vector.png',
                                width: 22,
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              '¿Necesitas más ayuda? Contacta a soporte',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF818181),
                                fontSize: 12,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
