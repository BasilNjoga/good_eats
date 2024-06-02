// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Cart on _Cart, Store {
  Computed<List<Product>>? _$uniqueProductsComputed;

  @override
  List<Product> get uniqueProducts => (_$uniqueProductsComputed ??=
          Computed<List<Product>>(() => super.uniqueProducts,
              name: '_Cart.uniqueProducts'))
      .value;
  Computed<double>? _$cartValueComputed;

  @override
  double get cartValue => (_$cartValueComputed ??=
          Computed<double>(() => super.cartValue, name: '_Cart.cartValue'))
      .value;

  late final _$_cartContentAtom =
      Atom(name: '_Cart._cartContent', context: context);

  @override
  ObservableList<Product> get _cartContent {
    _$_cartContentAtom.reportRead();
    return super._cartContent;
  }

  @override
  set _cartContent(ObservableList<Product> value) {
    _$_cartContentAtom.reportWrite(value, super._cartContent, () {
      super._cartContent = value;
    });
  }

  late final _$_freightAtom = Atom(name: '_Cart._freight', context: context);

  @override
  double get _freight {
    _$_freightAtom.reportRead();
    return super._freight;
  }

  @override
  set _freight(double value) {
    _$_freightAtom.reportWrite(value, super._freight, () {
      super._freight = value;
    });
  }

  late final _$_CartActionController =
      ActionController(name: '_Cart', context: context);

  @override
  void addToCart(Product product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyCart() {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.emptyCart');
    try {
      return super.emptyCart();
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeQuantity(Product product, int quantity) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.changeQuantity');
    try {
      return super.changeQuantity(product, quantity);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllFromCart(Product product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.removeAllFromCart');
    try {
      return super.removeAllFromCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uniqueProducts: ${uniqueProducts},
cartValue: ${cartValue}
    ''';
  }
}
