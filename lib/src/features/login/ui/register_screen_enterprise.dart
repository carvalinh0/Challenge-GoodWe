import 'package:flutter/material.dart';

class RegisterScreenEnterprise extends StatefulWidget {
  const RegisterScreenEnterprise({super.key});

  @override
  State<RegisterScreenEnterprise> createState() =>
      _RegisterScreenEnterpriseState();
}

class _RegisterScreenEnterpriseState extends State<RegisterScreenEnterprise> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _userNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Por favor, insira o e-mail';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'E-mail inválido';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Por favor, insira a senha';
    if (value.length < 6) return 'A senha deve ter ao menos 6 caracteres';
    return null;
  }

  String? _validateCountry(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o país/região';
    return null;
  }

  String? _validateCompanyName(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o nome da empresa';
    return null;
  }

  String? _validateCompanyAddress(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o endereço da empresa';
    return null;
  }

  String? _validatePostalCode(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o código postal';
    return null;
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o nome do usuário';
    return null;
  }

  String? _validateMobileNumber(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o número de celular';
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) return 'Número de celular inválido';
    return null;
  }

  String? _validateVerificationCode(String? value) {
    if (value == null || value.isEmpty)
      return 'Por favor, insira o código de verificação';
    return null;
  }

  String? _validateConfirmEmail(String? value) {
    if (value == null || value.isEmpty) return 'Por favor, confirme o e-mail';
    if (value != _emailController.text) return 'Os e-mails não coincidem';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de Conta"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // País
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: "Country/Region",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateCountry,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Nome da empresa
                TextFormField(
                  controller: _companyNameController,
                  decoration: const InputDecoration(
                    labelText: "Company Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateCompanyName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Endereço
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: "Company Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateCompanyAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Código postal
                TextFormField(
                  controller: _postalCodeController,
                  decoration: const InputDecoration(
                    labelText: "Postal Code",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePostalCode,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Nome do usuário
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    labelText: "User Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateUserName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
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
                // Confirmar Email
                TextFormField(
                  controller: _confirmEmailController,
                  decoration: const InputDecoration(
                    labelText: "Confirm Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateConfirmEmail,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Senha
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
                const SizedBox(height: 16),
                // Número de celular
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    labelText: "Mobile Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: _validateMobileNumber,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Código de verificação
                TextFormField(
                  controller: _verificationCodeController,
                  decoration: const InputDecoration(
                    labelText: "Verification Code",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateVerificationCode,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _tryLogin,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Registrar'),
                  ),
                ),
                TextButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                  child: const Text("Já tem uma conta? Voltar para o login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
