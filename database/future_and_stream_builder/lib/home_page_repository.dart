class HomeRepository{
  Future<List<String>> getAllNames() async{
    await Future.delayed(const Duration(seconds: 5));
    return ['Júlia', 'Teste1', 'Teste2', 'Teste3'];
  }
}