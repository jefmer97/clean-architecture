import 'package:cleanarchitecture/core/usecases/usecase.dart';
import 'package:cleanarchitecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:cleanarchitecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:cleanarchitecture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  // ignore: prefer_const_declarations
  // ignore: prefer_const_constructors
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'Should get trivia from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository?.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase!(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
