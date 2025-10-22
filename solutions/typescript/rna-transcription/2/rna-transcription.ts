interface dict {
    [key: string]: string
}
export const complement: dict = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
};

export function toRna(code: string): string {
  for (const nucleotide of code) {
    if (!(nucleotide in complement)) {
      throw new Error("Invalid input DNA.");
    }
  }
  
  return code.split("").map(nucleotide => complement[nucleotide] ?? "").join("");
}
