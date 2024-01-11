import 'package:bside_todolist/api/api.dart';
import 'package:bside_todolist/api/apiClient.dart';
import 'package:bside_todolist/common/components/ui/button.dart';
import 'package:bside_todolist/common/components/ui/system/colors.dart';
import 'package:bside_todolist/common/components/ui/system/texts.dart';
import 'package:bside_todolist/common/provider/user.dart';
import 'package:bside_todolist/profile/edit/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  final _nicknameController = TextEditingController();
  final _commentController = TextEditingController();
  XFile? _pickedFile = null;

  // 1. update image local state with image picker

  setPickedFile(XFile pickedXFile) {
    setState(() {
      _pickedFile = pickedXFile;
    });
  }

  // 3. POST user
  Future<void> submit(nickname, comment) async {
    final List<MultipartFile> profileImage = [];
    PostImagesProfileResponse? postImagesRseponse;

    if (_pickedFile != null) {
      profileImage.add(
        MultipartFile.fromBytes(
          await _pickedFile!.readAsBytes(),
          filename: _pickedFile!.name,
          contentType: MediaType('application', 'octet-stream'),
        ),
      );

      print('post question images start');
      postImagesRseponse =
          (await getApiClient().postImagesProfile(profileImage))?.data;
      print('post question images done');
    }

    print('patch users start');
    try {
      await ref.read(userRiverProvider.notifier).patchUsers(
            PatchUsersRequest(
              profileUrl: postImagesRseponse?.profileImageUrl,
              nickName: _nicknameController.text,
              comment: _commentController.text,
            ),
          );

      print('patch users done');
    } catch (e) {
      print(e);
      print('patch users error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userRiverProvider);
    print(user);
    String? nickname = user?.value?.nickName ?? '';
    String? comment = user?.value?.comment ?? '';

    if (user.hasError) {
      print('has error');
    }
    if (user.isLoading) {
      print('has loading');
    }
    if (user.hasValue) {
      print('has value');
      print(user.value);

      _nicknameController.value = TextEditingValue(
        text: nickname!,
        selection: TextSelection.fromPosition(
          TextPosition(offset: nickname.length),
        ),
      );

      _commentController.value = TextEditingValue(
        text: comment!,
        selection: TextSelection.fromPosition(
          TextPosition(offset: comment.length),
        ),
      );
    }

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
                onPressed: () => submit(nickname, comment),
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
              child: ImagePickerExample(setPickedFile: setPickedFile),
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
                    nickname == null
                        ? TextFormField(
                            onSaved: (String? value) {
                              debugPrint(
                                  'nickname for field  saved as "$value"');
                            },
                            controller: _nicknameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: MyColors.cardFill,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                suffix: IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: _nicknameController.clear,
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: MyColors.gray500,
                                    ))),
                          )
                        : TextFormField(
                            onSaved: (String? value) {
                              debugPrint(
                                  'nickname for field  saved as "$value"');
                            },
                            controller: _nicknameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: MyColors.cardFill,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
