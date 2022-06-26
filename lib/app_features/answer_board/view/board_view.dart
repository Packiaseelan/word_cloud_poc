import 'package:flutter/material.dart';
import 'package:word_cloud_poc/app_features/answer_board/view/scatter_item.dart';
import 'package:word_cloud_poc/components/scatter/rendering/scatter.dart';
import 'package:word_cloud_poc/components/scatter/widgets/scatter.dart';
import 'package:word_cloud_poc/config/app_theme.dart';
import 'package:word_cloud_poc/models/scatter_model.dart';

class BoardView extends StatelessWidget {
  final List<ScatterModel> scaterModel;
  const BoardView({Key? key, required this.scaterModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];
    for (var i = 0; i < scaterModel.length; i++) {
      widgets.add(ScatterItem(scaterModel[i], i));
    }

    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / 300;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.primaryColor,
      ),
      child: scaterModel.isEmpty
          ? const SizedBox()
          : Center(
              child: FittedBox(
                child: Scatter(
                  fillGaps: true,
                  delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
                  children: widgets,
                ),
              ),
            ),
    );
  }
}
