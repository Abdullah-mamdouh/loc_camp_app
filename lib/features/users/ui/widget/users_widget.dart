
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/widgets/indicator_widget.dart';
import 'package:loc_camp_app/core/widgets/state_handler_widget.dart';
import 'package:loc_camp_app/features/users/logic/users_cubit.dart';
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
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: BlocListener<UsersCubit, UsersState>(
        listenWhen: (previous, current) =>
            current is Loading ||
            current is Success ||
            current is Error ||
            current is IsConnected,
        listener: (context, state) {
          state.whenOrNull(
            isConnected: () {
              StateHandler.setupErrorState(context, 'No Internet Connection');
            },
            loading: () {
              print(_data[0].toString()+"adffffffffffffff");
            },
            success: (data){
              print(data.toString()+'dsAAAAAAAAAA');
            }
          );
        },
        child: users.isNotEmpty ? ListView.builder(
          controller: _scrollController,
          itemCount: _data.length + 1,
          // itemCount: UsersCubit.users.length,
          itemBuilder: (context, index) {
            print(users.length);
            if (index < _data.length) {
              return SlideFadeAnimation(
                index: index,
                animationDuration: 1000,
                verticalOffset: 200,
                child: UserCardWidget(user: users[index],)
                /*Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width.w,
                    padding: EdgeInsets.all(5.0),
                    height: 160.h,
                    child: GestureDetector(
                      child: Flexible(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0.h),
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite),
                                  iconSize: 25.h,
                                  color: Colors.black,
                                  onPressed: () {}),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: ClipOval(
                                    /*child: Image.network(
                                  '',
                                  //users[index].image!,
                                  height: 150.h,
                                  width: 150.w,
                                  fit: BoxFit.fill,
                                ),*/
                                  ),
                                  radius: 60.sp,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Column(
                                    children: [
                                      Text(
                                        users[index].address!.street!,
                                        style: TextStyle(
                                            fontSize: 12.h, color: Colors.black),
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.add_shopping_cart),
                                            iconSize: 25.h,
                                            color: Colors.blue,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 55.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${users[index].phone} \$",
                                              style:
                                              TextStyle(color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                              //maxLines: 1,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),*/
              );
            } else {
              if(index != users.length){
                return IndicatorWidget();

              }

            }
          },
        ) : IndicatorWidget(),
      ),
    );
  }

}
