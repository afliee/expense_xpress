import 'package:expense_xpress/generated/l10n.dart';
import 'package:expense_xpress/pages/profile/default_gallery_screen.dart';
import 'package:expense_xpress/services/functions/user_service.dart';
import 'package:expense_xpress/services/models/user.dart';
import 'package:expense_xpress/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetChangeProfile {
  static Future<void> show(
      BuildContext context, User? user, Function onAvatarChanged) async {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Text(
                  S.of(context).editProfile,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                )),
                AppStyles.sizedBoxSpace(height: 12),
                Center(
                  child: Text(
                    S.of(context).youCanEditYourProfileWithUsOptions,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                AppStyles.sizedBoxSpace(height: 16),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                  shadowColor: Theme.of(context).primaryColor,
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefaultGalleryScreen(
                              user: user,
                            ),
                          )).then((user) {
                        print('value: ${user.toString()}');
                        onAvatarChanged(user);
                      });
                    },
                    leading: Icon(
                      // icon gallary
                      Icons.photo_library,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text(
                      S.of(context).defaultGallery,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      S.of(context).choosePhotoFromUsGallery,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(
                      // faward icon ios
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                  shadowColor: Theme.of(context).primaryColor,
                  elevation: 2,
                  child: ListTile(
                    onTap: () async {
                      // Navigator.pop(context);
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        user?.photoUrl = image.path;
                        user?.avatarType = AvatarType.camera;
                        UserService.updateUser(user!);
                        onAvatarChanged(user);
                        // hide bottom sheet
                        if (context.mounted) {
                          Navigator.pop(context, user);
                        }
                      }
                    },
                    leading: Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text(
                      S.of(context).yourCamera,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      S.of(context).takePhotoWithYourCamera,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(
                      // faward icon ios
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                  shadowColor: Theme.of(context).primaryColor,
                  elevation: 2,
                  child: ListTile(
                    onTap: () async {
                      // Navigator.pop(context);
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        user?.photoUrl = image.path;
                        user?.avatarType = AvatarType.gallery;
                        await UserService.updateUser(user!);
                        onAvatarChanged(user);
                        // hide bottom sheet
                        if (context.mounted) {
                          Navigator.pop(context, user);
                        }
                      }
                    },
                    leading: Icon(Icons.photo_library,
                        color: Theme.of(context).colorScheme.onBackground),
                    title: Text(
                      S.of(context).yourGallery,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      S.of(context).choosePhotoFromYourGallery,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: const Icon(
                      // faward icon ios
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
