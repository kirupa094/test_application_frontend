import 'package:flutter/material.dart';
import 'package:test_application/model/profile_model.dart';
import 'package:test_application/resource/provider/provider.dart';
import 'package:test_application/screens/profile/ui_state.dart';

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
                  ProfileModel profileModel=uiState.result;
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
                  return const SizedBox.shrink();
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
}
