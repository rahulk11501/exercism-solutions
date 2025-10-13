export const CODING: { [key: string]: number } = {
  black: 0, brown: 1, red: 2,
  orange: 3, yellow: 4, green: 5,
  blue: 6, violet: 7, grey: 8, white: 9
};

export const UNITS = [
  { threshold: 9, name: "gigaohms", divisor: 1e9 },
  { threshold: 6, name: "megaohms", divisor: 1e6 },
  { threshold: 2, name: "kiloohms", divisor: 1e3 },
  { threshold: 0, name: "ohms", divisor: 1 }
];

export interface ResistorValue {
  resistance: number;
  unitName: string;
  divisor: number;
  label: () => string;
}

export function decodedResistorValue(colors: string[]): string {

  const baseValue = Number(`${CODING[colors[0]]}${CODING[colors[1]]}`)
  const multiplierExp = CODING[colors[2]];

  const resistance = baseValue * Math.pow(10, multiplierExp);
  const unit = UNITS.find(u => multiplierExp >= u.threshold)!;

  return `${resistance / unit.divisor} ${unit.name}`
}