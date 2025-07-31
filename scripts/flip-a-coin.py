from random import seed, choice

possibilities = ["Cara", "Coroa"]


def play() -> str:
    seed()
    return choice(possibilities)


def best_of(number_of_plays: int) -> list:
    results = []
    for i in range(number_of_plays):
        round = play()
        print(f"{i+1}: {round}")
        results.append(round)
    return results


def get_winner(game: list) -> str:
    winner = ""
    winner_count = 0
    for possibility in possibilities:
        current_count = game.count(possibility)
        if current_count > winner_count:
            winner = possibility
            winner_count = current_count

    return winner


def main() -> None:
    game = best_of(5)
    print(f"Vencedor: {get_winner(game)}")


if __name__ == "__main__":
    main()
