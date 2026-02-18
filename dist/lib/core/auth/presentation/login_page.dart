import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_models.dart';
import '../auth_providers.dart';

class QmArr4NYD extends ConsumerStatefulWidget {
  const QmArr4NYD({super.key});

  @override
  ConsumerState<QmArr4NYD> createState() => _CfwzNwgzOYdF4d();
}

class _CfwzNwgzOYdF4d extends ConsumerState<QmArr4NYD> {
  final _huQJMNT = GlobalKey<FormState>();
  final _tlbrQmmXeo4s = TextEditingController();
  final _fNIjpd1bgTxy = TextEditingController();

  bool _jVCgByp = false;
  bool _kLg0vMP6GmQrkAW = true;
  ProviderSubscription<VgJlYXlcR>? _x5EcCkp;

  @override
  void initState() {
    super.initState();

    _x5EcCkp = ref.listenManual<VgJlYXlcR>(authControllerProvider, (
      prev,
      next,
    ) {
      if (prev?.axjCVg == Ja6KZpv6M7.d70OR6T &&
          next.axjCVg != Ja6KZpv6M7.d70OR6T) {
        return;
      }

      if (prev?.axjCVg != next.axjCVg && mounted) {
        if (next.axjCVg == Ja6KZpv6M7.rWrnh809fWrwm00 && _jVCgByp) {
          setState(() => _jVCgByp = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login fallido. Revisa tus credenciales.'),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _x5EcCkp?.close();
    _tlbrQmmXeo4s.dispose();
    _fNIjpd1bgTxy.dispose();
    super.dispose();
  }

  Future<void> _kjZM96() async {
    final ok = _huQJMNT.currentState?.validate() ?? false;
    if (!ok) return;

    final username = _tlbrQmmXeo4s.text.trim();
    final password = _fNIjpd1bgTxy.text;

    setState(() => _jVCgByp = true);
    await ref.read(authControllerProvider.notifier).pPCVW(username, password);

    if (!mounted) return;
    setState(() => _jVCgByp = false);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final horizontalPadding = constraints.maxWidth >= 1200
            ? 120.0
            : constraints.maxWidth >= 900
            ? 80.0
            : constraints.maxWidth >= 600
            ? 60.0
            : 24.0;

        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isTablet ? 32 : 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: isTablet ? 56 : 48,
                          height: isTablet ? 56 : 48,
                          decoration: BoxDecoration(
                            color: cs.primary.withAlpha(22),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.description_rounded,
                            color: cs.primary,
                            size: isTablet ? 30 : 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GTO Docs',
                                style: TextStyle(
                                  fontSize: isTablet ? 28.0 : 22.0,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.2,
                                  color: cs.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Acceso con tu cuenta',
                                style: TextStyle(
                                  fontSize: isTablet ? 14 : 13,
                                  color: cs.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: isTablet ? 22 : 18),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(isTablet ? 24 : 16),
                        child: Form(
                          key: _huQJMNT,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Iniciar sesión',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Ingresa tu usuario y contraseña para continuar.',
                                style: TextStyle(color: cs.onSurfaceVariant),
                              ),
                              SizedBox(height: isTablet ? 22 : 16),
                              TextFormField(
                                controller: _tlbrQmmXeo4s,
                                decoration: const InputDecoration(
                                  labelText: 'Usuario AD o correo',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    (value == null || value.trim().isEmpty)
                                    ? 'Campo requerido'
                                    : null,
                              ),
                              SizedBox(height: isTablet ? 18 : 12),
                              TextFormField(
                                controller: _fNIjpd1bgTxy,
                                obscureText: _kLg0vMP6GmQrkAW,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _kLg0vMP6GmQrkAW
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () => setState(
                                      () =>
                                          _kLg0vMP6GmQrkAW = !_kLg0vMP6GmQrkAW,
                                    ),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => _kjZM96(),
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                    ? 'Campo requerido'
                                    : null,
                              ),
                              SizedBox(height: isTablet ? 22 : 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _jVCgByp ? null : _kjZM96,
                                  child: _jVCgByp
                                      ? const SizedBox(
                                          height: 22,
                                          width: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text('Ingresar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isTablet ? 18 : 14),
                    AnimatedOpacity(
                      opacity: _jVCgByp ? 0.65 : 1,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        '© 2025 GTO Docs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 13 : 12,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
