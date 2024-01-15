import 'package:cleanarchitecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:cleanarchitecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:cleanarchitecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  // ignore: prefer_const_declarations
  final tNumber = 1;
  // ignore: prefer_const_constructors
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'Should get trivia for the number repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase!(Params(number: tNumber));
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
