import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loc_camp_app/core/widgets/indicator_widget.dart';
import 'package:loc_camp_app/core/widgets/state_handler_widget.dart';
import 'package:loc_camp_app/features/users/logic/users_cubit.dart';
import 'package:loc_camp_app/features/users/ui/widget/app_bar_widget.dart';
import 'package:loc_camp_app/features/users/ui/widget/user_card_widget.dart';
import '../../logic/users_state.dart';
import 'slide_fade_animation.dart';

class UsersWidget extends StatefulWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  _UsersWidgetState createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  ScrollController _scrollController = ScrollController();
  List<int> _data = List.generate(5, (index) => index); // Initial data

  int usersLength = 0;
  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsers();

    // usersLength =
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(1, (index) => _data.length + index));
        if (_data.length >= UsersCubit.users.length) {
          _data.length = UsersCubit.users.length;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var users = UsersCubit.users;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarWidget()),
      body: BlocListener<UsersCubit, UsersState>(
        listenWhen: (previous, current) =>
            current is Loading ||
            current is Success ||
            current is Error ||
            current is IsConnected,
        listener: (context, state) {
          state.whenOrNull(isConnected: () {
            StateHandler.setupErrorState(context, 'No Internet Connection');
          }, loading: () {
            debugPrint(_data[0].toString() + "adffffffffffffff");
          }, success: (data) {
            debugPrint(data.toString() + 'dsAAAAAAAAAA');
          });
        },
        child: users.isNotEmpty
            ? Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0.h),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _data.length + 1,
                  // itemCount: UsersCubit.users.length,
                  itemBuilder: (context, index) {
                    debugPrint(users.length.toString());
                    if (index < _data.length) {
                      return SlideFadeAnimation(
                          index: index,
                          animationDuration: 1000,
                          verticalOffset: 200,
                          child: UserCardWidget(
                            user: users[index],
                          ));
                    } else {
                      if (index != users.length) {
                        return IndicatorWidget();
                      }
                    }
                  },
                ),
            )
            : IndicatorWidget(),
      ),
    );
  }
}
