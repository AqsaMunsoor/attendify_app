// ignore_for_file: library_private_types_in_public_api

part of '../configs.dart';

class Space {
  static _H get x => _H();
  static _V get y => _V();
  static _Padding get p => _Padding();
  static _Margin get m => _Margin();
}

class _H {
  SizedBox get t04 => const SizedBox(width: 4);
  SizedBox get t06 => const SizedBox(width: 6);
  SizedBox get t08 => const SizedBox(width: 8);
  SizedBox get t12 => const SizedBox(width: 12);
  SizedBox get t16 => const SizedBox(width: 16);
  SizedBox get t24 => const SizedBox(width: 24);
}

class _V {
  SizedBox get t04 => const SizedBox(height: 4);
  SizedBox get t06 => const SizedBox(height: 6);
  SizedBox get t08 => const SizedBox(height: 8);
  SizedBox get t12 => const SizedBox(height: 12);
  SizedBox get t16 => const SizedBox(height: 16);
  SizedBox get t24 => const SizedBox(height: 24);
  SizedBox get t32 => const SizedBox(height: 32);
}

class _Padding {
  final vertical = _VerticalPadding();
  final horizontal = _HorizontalPadding();
  final top = _TopPadding();
  final bottom = _BottomPadding();
  final all = _AllPadding();

  EdgeInsets get screen =>
      const EdgeInsets.symmetric(vertical: 15, horizontal: 20);
  EdgeInsets get listView => const EdgeInsets.fromLTRB(16, 0, 16, 60);
}

class _VerticalPadding {
  EdgeInsets get t04 => const EdgeInsets.symmetric(vertical: 4);
  EdgeInsets get t06 => const EdgeInsets.symmetric(vertical: 6);
  EdgeInsets get t08 => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get t12 => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get t16 => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get t24 => const EdgeInsets.symmetric(vertical: 24);
  EdgeInsets get t32 => const EdgeInsets.symmetric(vertical: 32);
}

class _HorizontalPadding {
  EdgeInsets get t04 => const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsets get t06 => const EdgeInsets.symmetric(horizontal: 6);
  EdgeInsets get t08 => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get t12 => const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get t16 => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get t24 => const EdgeInsets.symmetric(horizontal: 24);
  EdgeInsets get t32 => const EdgeInsets.symmetric(horizontal: 32);
}

class _TopPadding {
  EdgeInsets get t04 => const EdgeInsets.only(top: 4);
  EdgeInsets get t06 => const EdgeInsets.only(top: 6);
  EdgeInsets get t08 => const EdgeInsets.only(top: 8);
  EdgeInsets get t12 => const EdgeInsets.only(top: 12);
  EdgeInsets get t16 => const EdgeInsets.only(top: 16);
  EdgeInsets get t24 => const EdgeInsets.only(top: 24);
  EdgeInsets get t32 => const EdgeInsets.only(top: 32);
}

class _BottomPadding {
  EdgeInsets get t04 => const EdgeInsets.only(bottom: 4);
  EdgeInsets get t06 => const EdgeInsets.only(bottom: 6);
  EdgeInsets get t08 => const EdgeInsets.only(bottom: 8);
  EdgeInsets get t12 => const EdgeInsets.only(bottom: 12);
  EdgeInsets get t16 => const EdgeInsets.only(bottom: 16);
  EdgeInsets get t24 => const EdgeInsets.only(bottom: 24);
}

class _AllPadding {
  EdgeInsets get t04 => const EdgeInsets.all(4);
  EdgeInsets get t06 => const EdgeInsets.all(6);
  EdgeInsets get t08 => const EdgeInsets.all(8);
  EdgeInsets get t12 => const EdgeInsets.all(12);
  EdgeInsets get t16 => const EdgeInsets.all(16);
  EdgeInsets get t24 => const EdgeInsets.all(24);
  EdgeInsets get t32 => const EdgeInsets.all(32);
}

class _Margin {
  final vertical = _VerticalPadding();
  final horizontal = _HorizontalPadding();
  final top = _TopPadding();
  final bottom = _BottomPadding();
  final all = _AllPadding();

  EdgeInsets get card =>
      const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
}
