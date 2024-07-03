import 'package:fluttertest/core/widgets/custom_error_widget.dart';
import 'package:fluttertest/features/home/presentation/manager/featured_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureddatasListView extends StatelessWidget {
  const FeatureddatasListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureddatasCubit, FeatureddatasState>(
      builder: (context, state) {
        if (state is FeatureddatasFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FeatureddatasSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.datas.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return null;
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
