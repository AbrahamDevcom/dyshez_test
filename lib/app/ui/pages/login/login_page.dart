import 'package:dyshez_test/app/ui/global_widgets/custom_button.dart';
import 'package:dyshez_test/app/ui/pages/home/home_page.dart';
import 'package:dyshez_test/app/ui/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../theme/colors_theme.dart';

class LoginPage extends StatelessWidget {
  static const String route = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: secondaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
          child: SingleChildScrollView(
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
                        'Iniciar Sesión',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x10000000),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: double.infinity,
                          child: TextFormField(
                            controller: controller.emailController,
                            autofocus: true,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'email',
                              enabledBorder: defaultBorder(color: alternate),
                              focusedBorder: defaultBorder(color: primary),
                              errorBorder: defaultBorder(color: alternate),
                              focusedErrorBorder: defaultBorder(color: alternate),
                              filled: true,
                              fillColor: secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                              prefixIcon: const Icon(
                                Icons.alternate_email_outlined,
                                color: Color(0xFF858585),
                                size: 18,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: primary,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x10000000),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: controller.passwordController,
                              autofocus: true,
                              autofillHints: [AutofillHints.password],
                              obscureText: !controller.passwordVisibility,
                              decoration: InputDecoration(
                                isDense: false,
                                hintText: 'Password',
                                enabledBorder: defaultBorder(color: alternate),
                                focusedBorder: defaultBorder(color: primary),
                                errorBorder: defaultBorder(color: alternate),
                                focusedErrorBorder: defaultBorder(color: alternate),
                                filled: true,
                                fillColor: secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: Color(0xFF858585),
                                  size: 18,
                                ),
                                suffixIcon: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () => controller.passwordVisibility = !controller.passwordVisibility,
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    controller.passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    color: const Color(0xFF757575),
                                    size: 18,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: primary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: CsButtonWidget(
                          onPressed: () async {
                            final res = await controller.signInWithEmail();
                            if (res.user != null) {
                              Navigator.pushReplacementNamed(context, HomePage.route);
                            }
                          },
                          text: 'Iniciar Sesión',
                          options: CsButtonOptions(
                            width: double.infinity,
                            height: 52,
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: const Color(0xFFE3026F),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),

                      // You will have to add an action on this rich text to go to your login page.
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '¿No tienes cuenta?',
                              style: TextStyle(color: black),
                            ),
                            TextSpan(
                              text: 'Crea una  nueva cuenta',
                              style: TextStyle(
                                color: primaryOptional,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),

                      const Divider(
                        thickness: 1,
                        color: Color(0xFFECECEC),
                      ),

                      // You will have to add an action on this rich text to go to your login page.
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                  color: black,
                                ),
                              ),
                              TextSpan(
                                text: 'Recupera tu cuenta',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: primaryOptional,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 16),
                  child: CsButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Iniciar sesión con Google',
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 20,
                    ),
                    options: CsButtonOptions(
                      width: double.infinity,
                      height: 44,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: secondaryBackground,
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      elevation: 0,
                      borderSide: const BorderSide(
                        color: alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      hoverColor: primaryBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder defaultBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
