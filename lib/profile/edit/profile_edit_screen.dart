import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/user.dart';
import 'package:bside_todolist/profile/edit/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  final _nicknameController = TextEditingController();
  final _commentController = TextEditingController();
  Image? _profileImage = null;
  String? _profileUrlEdited = null;

  // 1. update image local state with image picker

  // 2. POST profile image
  Future<void> editProfileUrl() async {
    print('get image');

    print('update local image');

    setState(() {
      print('set _profileImage');
    });
  }

  // 3. POST user
  Future<void> submit() async {
    if (_profileUrlEdited == null) return;
    print('save start');
    try {
      await ref.read(userRiverProvider.notifier).postUser(
            PostUserRequest(
              profileImageUrl: _profileUrlEdited!,
              nickName: _nicknameController.text,
              comment: _commentController.text,
            ),
          );
      print('save done');
    } catch (e) {
      print(e);
      print('save error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userRiverProvider.notifier);
    String? profileUrl = user.state.value?.profileUrl;
    print(_nicknameController.text);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('정보 수정', style: MyTexts.KR17700),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: MyColors.blackBasic),
            onPressed: () {
              context.pop();
            },
          ),
          actions: [
            Center(
              child: MyButton(
                type: 'transparent',
                onPressed: null,
                child: const Text('저장'),
              ),
            ),
            SizedBox(width: 10)
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(height: 22),
            Center(
              child: ImagePickerExample(
                profileUrl: profileUrl,
              ),
            ),
            SizedBox(height: 22),
            Form(
              onChanged: () {
                Form.of(primaryFocus!.context!).save();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('닉네임', style: MyTexts.KR16700),
                    TextFormField(
                      onSaved: (String? value) {
                        debugPrint('nickname for field  saved as "$value"');
                      },
                      controller: _nicknameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: MyColors.cardFill,
                          hintText: '수험생123',
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          suffix: IconButton(
                              splashColor: Colors.transparent,
                              onPressed: _nicknameController.clear,
                              icon: const Icon(
                                Icons.clear_rounded,
                                color: MyColors.gray500,
                              ))),
                    ),
                    SizedBox(height: 32),
                    Text('각오 한마디', style: MyTexts.KR16700),
                    TextFormField(
                      onSaved: (String? value) {
                        debugPrint('comment for field  saved as "$value"');
                      },
                      controller: _commentController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.cardFill,
                        hintText: '수험생123',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        suffix: IconButton(
                            splashColor: Colors.transparent,
                            onPressed: _commentController.clear,
                            icon: const Icon(
                              Icons.clear_rounded,
                              color: MyColors.gray500,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: null,
      ),
    );
  }
}
