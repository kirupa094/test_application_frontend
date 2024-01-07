import 'package:flutter/material.dart';
import 'package:test_application/model/profile_model.dart';
import 'package:test_application/resource/provider/provider.dart';
import 'package:test_application/screens/profile/ui_state.dart';
import 'package:test_application/utils/custom_function.dart';
import 'package:test_application/widgets/custom_button.dart';
import 'package:test_application/widgets/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of(context).userBloc;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(15),
          child: StreamBuilder<UIState>(
            stream: userBloc.profileInfo,
            builder: (context, AsyncSnapshot<UIState> snapshot) {
              if (snapshot.hasData) {
                UIState uiState = snapshot.data!;
                if (uiState is LoadingUIState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (uiState is ResultUIState) {
                  ProfileModel profileModel = uiState.result;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            color: const Color.fromARGB(255, 16, 80, 120),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Hi!, ${profileModel.firstName} ${profileModel.lastName}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  );
                } else if (uiState is UnAuthenticatedUIState) {
                  // logout();
                  return const SizedBox.shrink();
                } else if (uiState is ErrorUIState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 16, 80, 120),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Hi!, Kiruba Karan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.email,
                                color: Color.fromARGB(255, 16, 80, 120)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'kirupakaran094@gmail.com',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.phone,
                                color: Color.fromARGB(255, 16, 80, 120)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '+94768716424',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            isIcon: true,
                            title: 'UPDATE',
                            onPressedCallBack: () => {
                              _dialogBuilder(context),
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        String firstName = '';
        String lastName = '';

        final GlobalKey<FormState> form = GlobalKey<FormState>();
        return AlertDialog(
          title: const Text('Update Profile'),
          content: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldWidget(
                  hintText: 'First Name',
                  obscureText: false,
                  validator: (value) {
                    if (!CustomFunction.isNotEmpty(value!)) {
                      return "First Name Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    firstName = value;
                  },
                  isPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldWidget(
                  hintText: 'Last Name',
                  obscureText: false,
                  isPassword: false,
                  validator: (value) {
                    if (!CustomFunction.isNotEmpty(value!)) {
                      return "Last Name Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    lastName = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () => {if (form.currentState!.validate()) {
                
              }},
            ),
          ],
        );
      },
    );
  }
}
