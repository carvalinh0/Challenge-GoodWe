import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'register_screen_enterprise.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedArea;
  bool _acceptedTerms = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // Simular login (exemplo)
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        // Aqui você pode navegar para a próxima tela ou mostrar mensagem
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o e-mail';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter ao menos 6 caracteres';
    }
    return null;
  }

  String? _confirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Criação de conta de usuário instalador?
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreenEnterprise(),
                  ),
                );
              },
              child: const Text(
                "Clique aqui para conseguir uma conta de instalador",
              ),
            ),
            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),

            // senha
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              validator: _validatePassword,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 24),

            // Confirm Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirme a senha",
                border: OutlineInputBorder(),
              ),
              validator: _confirmPassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _tryRegister(),
            ),
            const SizedBox(height: 8),

            // Área (radios)
            const Text("* Area", style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text("AUS/NZ & Oceania"),
                  value: "oceania",
                  groupValue: _selectedArea,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedArea = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Europe"),
                  value: "europe",
                  groupValue: _selectedArea,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedArea = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Americas"),
                  value: "americas",
                  groupValue: _selectedArea,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedArea = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Other"),
                  value: "other",
                  groupValue: _selectedArea,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedArea = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),
            // Checkbox dos termos
            CheckboxListTile(
              value: _acceptedTerms,
              onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
              controlAffinity: ListTileControlAffinity.leading,
              title: RichText(
                text: TextSpan(
                  text: "Eu sou um adulto, li e concordo com os termos.",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "GOODWE Terms of Use",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // abrir página de termos
                        },
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "GOODWE Portal Data Protection Statement",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // abrir página de privacidade
                        },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: _acceptedTerms ? _tryRegister : null,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Registrar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
