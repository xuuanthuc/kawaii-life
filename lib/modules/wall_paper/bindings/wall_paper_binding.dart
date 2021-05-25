

import 'package:get/get.dart';
import 'package:wibu_life/data/repositories/wall_paper_repository.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/modules/wall_paper/wall_paper_repository.dart';

class WallPaperBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WallPaperController>(() => WallPaperController());
    Get.lazyPut<IWallPaperRepository>(() => WallPaperRepository());
  }
}