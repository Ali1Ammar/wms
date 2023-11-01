import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wms/src/core/design/theme/space.dart';
import 'package:wms/src/core/design/widget/logo.dart';
import 'package:wms/src/core/design/widget/widget.dart';
import 'package:wms/src/core/route.dart';
import 'package:wms/src/core/utils/extensions/extensions.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppSpace.large,
              ),
              const AppLogo(
                size: 250,
              ),
              const SizedBox(
                height: AppSpace.large,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  context.translator.loginTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: AppSpace.large,
              ),
              FormTitleWithChild(
                title: context.translator.enterEmailOrUsername,
                child: CustomTextField(
                  hint: context.translator.enterEmailOrUsername,
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(
                height: AppSpace.small,
              ),
              FormTitleWithChild(
                title: context.translator.enterPassword,
                child: PasswordField(
                    isLoading: false, controller: TextEditingController()),
              ),
              const SizedBox(
                height: AppSpace.small,
              ),
              CheckboxListTile(
                  title: Text(context.translator.rememberMe),
                  value: false,
                  onChanged: (x) {
                    //
                  }),
              const SizedBox(
                height: AppSpace.small,
              ),
              CtaButton(
                title: context.translator.loginTitle,
                onPressed: () {
                  ref.read(appRouterProvider).push(const NavbarRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
