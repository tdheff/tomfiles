from enum import Enum

# Normal
# class Colors(str, Enum):
#     Base = "#191724"
#     Surface = "#1f1d2e"
#     Overlay = "#26233a"
#     Muted = "#6e6a86"
#     Subtle = "#908caa"
#     Text = "#e0def4"
#     Love = "#eb6f92"
#     Gold = "#f6c177"
#     Rose = "#ebbcba"
#     Pine = "#31748f"
#     Foam = "#9ccfd8"
#     Iris = "#c4a7e7"
#     HighlightLow = "#21202e"
#     HighlightMed = "#403d52"
#     HighlightHigh = "#524f67"

#     def __str__(self) -> str:
#         return str.__str__(self)

# Dawn
class Colors(str, Enum):
    Base = "#faf4ed"
    Surface = "#fffaf3"
    Overlay = "#f2e9e1"
    Muted = "#9893a5"
    Subtle = "#797593"
    Text = "#575279"
    Love = "#b4637a"
    Gold = "#ea9d34"
    Rose = "#d7827e"
    Pine = "#286983"
    Foam = "#56949f"
    Iris = "#907aa9"
    HighlightLow = "#f4ede8"
    HighlightMed = "#dfdad9"
    HighlightHigh = "#cecacd"

    def __str__(self) -> str:
        return str.__str__(self)
