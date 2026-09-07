// ============================================================
// AVALIAÇÃO FORMATIVA I
// Disciplina: Programação para Dispositivos Móveis
// Sistema: SkyHorizon Airlines
// ============================================================

// ============================================================
// EXERCÍCIO 1
// Abstração e Classes de Apoio
// ============================================================

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

// ============================================================
// EXERCÍCIOS 2 A 7
// Classe Passagem
// ============================================================

class Passagem {
  // Exercício 2
  String? _codigoLocalizador = '';

  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // Exercício 2
  // Construtor não nomeado
  Passagem();

  // Exercício 3
  Passagem.somenteCodigo(String codigoLocalizador) {
    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 3
  Passagem.completa(
    String codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes,
  ) {
    _codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  // Exercício 4
  Passagem.codigoEPassageiro({
    String? codigoLocalizador,
    this.passageiro,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 4
  Passagem.all(
    String codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 5
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 6
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }

    _codigoLocalizador = codigoLocalizador;
  }

  // Exercício 7
  void emitirPassagem() {
    print('Passagem emitida com sucesso!');
  }

  bool cancelarPassagem() {
    print('Passagem cancelada com sucesso!');
    return true;
  }

  void atualizarPassagem() {
    print('Passagem atualizada com sucesso!');
  }

  Passagem consultarPassagem(String codigo) {
    print('Passagem consultada com sucesso!');
    return Passagem();
  }
}

// ============================================================
// EXERCÍCIO 9
// MIXIN LOGGER
// ============================================================

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

// ============================================================
// EXERCÍCIO 9
// MIXIN AUDITORIA
// ============================================================

mixin Auditoria {
  void auditar(String mensagem) {
    print('[Auditoria]: $mensagem');
  }
}

// ============================================================
// EXERCÍCIO 8
// HERANÇA
// ============================================================

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(
    String codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes, {
    required this.loungeAcesso,
  }) : super.all(
          codigoLocalizador,
          passageiro: passageiro,
          plataforma: plataforma,
          atendente: atendente,
          observacoes: observacoes,
        );

  // Exercício 10
  @override
  void atualizarPassagem() {
    print('Passagem de Primeira Classe atualizada com sucesso!');

    log(
      'Alteração realizada pelo atendente: '
      '${super.atendente?.nome}',
    );

    auditar(
      'Verificação de segurança realizada para a Primeira Classe.',
    );
  }
}

// ============================================================
// EXERCÍCIO 10
// MAIN
// ============================================================

void main() {
  print('==============================================');
  print('          SKYHORIZON AIRLINES');
  print('          Sistema de Passagens');
  print('==============================================');

  // ==========================================================
  // CRIAÇÃO DO PASSAGEIRO
  // ==========================================================

  Passageiro passageiro1 = Passageiro();

  passageiro1.nome = 'Ana Luiza';
  passageiro1.cpf = '123.456.789-00';
  passageiro1.rg = '12.345.678-9';
  passageiro1.email = 'ana@email.com';
  passageiro1.celular = '(11) 99999-9999';

  // ==========================================================
  // CRIAÇÃO DA PLATAFORMA DE VENDA
  // ==========================================================

  PlataformaVenda plataforma1 = PlataformaVenda();

  plataforma1.codigoCanal = 1;
  plataforma1.nomeCanal = 'Site SkyHorizon';

  // ==========================================================
  // CRIAÇÃO DO ATENDENTE
  // ==========================================================

  Atendente atendente1 = Atendente();

  atendente1.nome = 'Carlos Silva';
  atendente1.matricula = 'AT001';
  atendente1.cargo = 'Atendente de Aeroporto';
  atendente1.email = 'carlos@skyhorizon.com';
  atendente1.celular = '(11) 98888-8888';
  atendente1.salario = 3500.00;

  // ==========================================================
  // PASSAGEM PADRÃO
  // ==========================================================

  print('\n--- PASSAGEM PADRÃO ---');

  Passagem passagem1 = Passagem();

  passagem1.passageiro = passageiro1;
  passagem1.plataforma = plataforma1;
  passagem1.atendente = atendente1;
  passagem1.observacoes = 'Janela';

  passagem1.codigoLocalizador = 'SH1234';

  print(
    'Código da passagem: '
    '${passagem1.codigoLocalizador}',
  );

  passagem1.emitirPassagem();

  // ==========================================================
  // TESTE DE VALIDAÇÃO
  // ==========================================================

  print('\n--- TESTE DE VALIDAÇÃO ---');

  passagem1.codigoLocalizador = '';

  passagem1.codigoLocalizador = null;

  // ==========================================================
  // PASSAGEM COM CONSTRUTOR ALL
  // ==========================================================

  print('\n--- PASSAGEM COM CONSTRUTOR ALL ---');

  Passageiro passageiro2 = Passageiro();

  passageiro2.nome = 'Maria Oliveira';
  passageiro2.cpf = '987.654.321-00';
  passageiro2.email = 'maria@email.com';

  PlataformaVenda plataforma2 = PlataformaVenda();

  plataforma2.codigoCanal = 2;
  plataforma2.nomeCanal = 'Aplicativo SkyHorizon';

  Atendente atendente2 = Atendente();

  atendente2.nome = 'Juliana Santos';
  atendente2.matricula = 'AT002';
  atendente2.cargo = 'Atendente de Vendas';

  Passagem passagem2 = Passagem.all(
    'SH5678',
    passageiro: passageiro2,
    plataforma: plataforma2,
    atendente: atendente2,
    observacoes: 'Bagagem adicional',
  );

  print(
    'Código da passagem: '
    '${passagem2.codigoLocalizador}',
  );

  print(
    'Passageiro: '
    '${passagem2.passageiro?.nome}',
  );

  print(
    'Plataforma: '
    '${passagem2.plataforma?.nomeCanal}',
  );

  passagem2.emitirPassagem();
  passagem2.atualizarPassagem();

  bool cancelada = passagem2.cancelarPassagem();

  print('Cancelamento realizado: $cancelada');

  // ==========================================================
  // CONSTRUTOR SOMENTE CÓDIGO
  // ==========================================================

  print('\n--- CONSTRUTOR SOMENTE CÓDIGO ---');

  Passagem passagem3 = Passagem.somenteCodigo('SH9999');

  print(
    'Código da passagem: '
    '${passagem3.codigoLocalizador}',
  );

  // ==========================================================
  // CONSTRUTOR CÓDIGO E PASSAGEIRO
  // ==========================================================

  print('\n--- CONSTRUTOR CÓDIGO E PASSAGEIRO ---');

  Passagem passagem4 = Passagem.codigoEPassageiro(
    codigoLocalizador: 'SH8888',
    passageiro: passageiro1,
  );

  print(
    'Código: ${passagem4.codigoLocalizador}',
  );

  print(
    'Passageiro: ${passagem4.passageiro?.nome}',
  );

  // ==========================================================
  // CONSULTA DE PASSAGEM
  // ==========================================================

  print('\n--- CONSULTA ---');

  Passagem consulta =
      passagem1.consultarPassagem('SH1234');

  print(
    'Nova instância criada: '
    '${consulta.codigoLocalizador}',
  );

  // ==========================================================
  // PASSAGEM DE PRIMEIRA CLASSE
  // ==========================================================

  print('\n--- PRIMEIRA CLASSE ---');

  PassagemPrimeiraClasse primeiraClasse =
      PassagemPrimeiraClasse(
    'VIP123',
    passageiro1,
    plataforma1,
    atendente1,
    'Serviço exclusivo',
    loungeAcesso: 'Sky Lounge',
  );

  print(
    'Código: '
    '${primeiraClasse.codigoLocalizador}',
  );

  print(
    'Passageiro: '
    '${primeiraClasse.passageiro?.nome}',
  );

  print(
    'Lounge: '
    '${primeiraClasse.loungeAcesso}',
  );

  // ==========================================================
  // POLIMORFISMO
  // ==========================================================

  print('\n--- POLIMORFISMO ---');

  Passagem passagemPolimorfica = primeiraClasse;

  passagemPolimorfica.atualizarPassagem();

  // ==========================================================
  // FINALIZAÇÃO
  // ==========================================================

  print('\n==============================================');
  print('       SISTEMA EXECUTADO COM SUCESSO');
  print('==============================================');
}