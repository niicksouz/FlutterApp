import 'package:flutter_test/flutter_test.dart';

Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

double calcularMedia(List<double> notas) {
  // Soma as notas e divide pelo número de notas para calcular a média
  double soma = notas.reduce((a, b) => a + b);  // Soma todas as notas
  return soma / notas.length;  // Divide pela quantidade de notas para calcular a média
}

void main() {
  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });

  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });

  test('Remover elemento', () {
    alunos.remove('Bruna');
    expect(alunos.containsKey('Bruna'), isFalse);
  });

  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);
    expect(alunos['Carla'], [9.0, 8.0]);
    alunos['Carla'] = [8.0, 9.0];
    expect(alunos['Carla'], [8.0, 9.0]);
  });

  test('Testar percorrer dicionário', () {
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);
    double soma = 0;
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });
    expect(soma, 68.0);
  });

  test('Calcular médias', () {
    Map<String, double> medias = {};

    // Calculando a média para cada aluno
    alunos.forEach((nome, notas) {
      medias[nome] = calcularMedia(notas);
    });

    // Verificando se as médias estão corretas
    expect(medias['Maria'], 8.5);  // Média de Maria = (8.0 + 9.0) / 2 = 8.5
    expect(medias['Carla'], 9.5);  // Média de Carla = (10.0 + 9.0) / 2 = 9.5
    expect(medias['Elena'], 8.5);  // Média de Elena = (9.0 + 8.0) / 2 = 8.5
    expect(medias['Luiza'], 8.5);  // Média de Luiza = (8.0 + 9.0) / 2 = 8.5
  });
}