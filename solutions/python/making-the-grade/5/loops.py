"""Module for organizing and calculating student exam scores."""

from typing import List, Union

def round_scores(student_scores: List[Union[int, float]]) -> List[int]:
    """Round all provided student scores."""
    return [round(score) for score in student_scores]


def count_failed_students(student_scores: List[int]) -> int:
    """Count the number of failing students out of the group provided."""
    return sum(1 for score in student_scores if score <= 40)


def above_threshold(student_scores: List[int], threshold: int) -> List[int]:
    """Determine which student scores are at or above the provided threshold."""
    return [score for score in student_scores if score >= threshold]


def letter_grades(highest: int) -> List[int]:
    """Create a list of grade thresholds based on the provided highest grade."""
    diff = (highest - 40) // 4
    return [41 + diff*ix for ix in range(4)]


def student_ranking(student_scores: List[int], student_names: List[str]) -> List[str]:
    """Organize the student's rank, name, and grade information in descending order."""
    output = []
    for ix, name in enumerate(student_names):
        output.append(f"{ix+1}. {name}: {student_scores[ix]}")
    return output


def perfect_score(student_info: List[List[Union[str, int]]]) -> List[Union[str, int]]:
    """Return the name and score of the first student with a perfect score, or an empty list."""
    for name, score in student_info:
        if score == 100:
            return [name, score]
    return []
