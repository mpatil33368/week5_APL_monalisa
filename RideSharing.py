# ride_sharing_statistics.py

from collections import Counter

class StatisticsCalculator:
    def __init__(self, data):
        self.data = sorted(data)

    def calculate_mean(self):
        return sum(self.data) / len(self.data)

    def calculate_median(self):
        n = len(self.data)
        if n % 2 == 0:
            return (self.data[n//2 - 1] + self.data[n//2]) / 2
        else:
            return self.data[n//2]

    def calculate_mode(self):
        freq = Counter(self.data)
        max_count = max(freq.values())
        return [key for key, val in freq.items() if val == max_count]

if __name__ == "__main__":
    data = [2, 3, 2, 5, 3, 4, 2, 5, 5]
    calculator = StatisticsCalculator(data)

    print(f"Mean: {calculator.calculate_mean():.2f}")
    print(f"Median: {calculator.calculate_median():.2f}")
    print(f"Mode(s): {calculator.calculate_mode()}")
