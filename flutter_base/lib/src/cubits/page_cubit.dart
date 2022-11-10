import 'cubit.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  void changepage(int page) => emit(page);
}
