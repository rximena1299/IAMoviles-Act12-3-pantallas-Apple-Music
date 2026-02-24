import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool obscurePassword = true;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool acceptedTerms = false;

  void validatePassword(String value) {
    setState(() {
      hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
      hasNumber = RegExp(r'[0-9]').hasMatch(value);
      hasMinLength = value.length >= 8;
    });
  }

  bool get isFormValid =>
      emailController.text.isNotEmpty &&
      nameController.text.isNotEmpty &&
      hasUppercase &&
      hasNumber &&
      hasMinLength &&
      acceptedTerms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF3B5C),
              Color(0xFFFF2D55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    label: const Text(
                      "Regresar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Crear cuenta",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          buildLabel("Correo electrónico"),
                          buildInput(emailController),
                          const SizedBox(height: 18),
                          buildLabel("Nombre"),
                          buildInput(nameController),
                          const SizedBox(height: 18),
                          buildLabel("Contraseña"),
                          buildPasswordField(),
                          const SizedBox(height: 8),
                          buildRequirement("Mínimo 8 caracteres", hasMinLength),
                          buildRequirement("Al menos una mayúscula", hasUppercase),
                          buildRequirement("Al menos un número", hasNumber),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Checkbox(
                                value: acceptedTerms,
                                activeColor: const Color(0xFFFF2D55),
                                onChanged: (value) {
                                  setState(() {
                                    acceptedTerms = value ?? false;
                                  });
                                },
                              ),
                              const Expanded(
                                child: Text(
                                  "Acepto los términos y condiciones",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isFormValid
                                    ? const Color(0xFFFF2D55)
                                    : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: isFormValid ? () {} : null,
                              child: const Text(
                                "Regístrate",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Center(
                            child: Text(
                              "Ximena Reyes 6ºi",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget buildInput(TextEditingController controller) {
    return TextField(
      controller: controller,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F2F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: obscurePassword,
      onChanged: validatePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F2F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
      ),
    );
  }

  Widget buildRequirement(String text, bool valid) {
    return Row(
      children: [
        Icon(
          valid ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: valid ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}