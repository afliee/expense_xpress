import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/contants.dart';
import 'package:expense_xpress/utils/dialogs.dart';
import 'package:expense_xpress/utils/images.dart';
import 'package:flutter/material.dart';

class DefaultGalleryScreen extends StatefulWidget {
  final User? user;

  const DefaultGalleryScreen({super.key, this.user});

  @override
  State<DefaultGalleryScreen> createState() => _DefaultGalleryScreenState();
}

class _DefaultGalleryScreenState extends State<DefaultGalleryScreen> {
  late final User? user;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).defaultGallery,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_selectedIndex != -1) {
                  print('selected index: $_selectedIndex');
                  user!.photoUrl =
                      '${ImagesAsset.avatarDefaultPath}_${_selectedIndex + 1}.${ImagesAsset.avatarDefaultExt}';
                  user!.avatarType = AvatarType.defaultGallery;
                  AppDialogs.of(context).showLoadingDialog();
                  try {
                    UserService.updateUser(user!).then((value) => {
                          AppDialogs.of(context).hideLoadingDialog(),
                          Navigator.pop(context, user),
                        });
                  } catch (e) {
                    print(e);
                    AppDialogs.of(context).hideLoadingDialog();

                    AppDialogs.of(context).showAlertDialog(
                        title: S.of(context).error,
                        message: e.toString(),
                        positiveText: S.of(context).ok,
                        onPositivePressed: () {
                          Navigator.pop(context);
                        });
                  }
                }
              },
              child: Text(
                S.of(context).save,
                style: _selectedIndex != -1
                    ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        )
                    : Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
              ),
            )
          ],
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: GridView.builder(
                itemCount: Constants.avatarDefaultSize,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: (index == _selectedIndex)
                              ? Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            '${ImagesAsset.avatarDefaultPath}_${index + 1}.${ImagesAsset.avatarDefaultExt}',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  );
                })));
  }

  @override
  void initState() {
    super.initState();
    user = widget.user!;
  }
}
