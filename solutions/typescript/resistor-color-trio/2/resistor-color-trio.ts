export interface ResistanceWithUnit {
  name: string;
  divisor: number;
}

export interface ResistorValue {
  resistance: number;
  unit: ResistanceWithUnit;
}

export interface Unit {
  threshold: number;
  name: string;
  divisor: number;
}   

export const COLOR_SEQUENCE: string[] = [
  "black", "brown", "red", "orange", "yellow",
  "green", "blue", "violet", "grey", "white"
];  

export const UNITS: Unit[] = [
  { threshold: 9, name: "gigaohms", divisor: 1e9 },
  { threshold: 6, name: "megaohms", divisor: 1e6 },
  { threshold: 2, name: "kiloohms", divisor: 1e3 },
  { threshold: 0, name: "ohms", divisor: 1 }
];

export function decodedResistorValue(colors: string[]): string {
  const { resistance, unit } = resistanceWithUnit(colors);
  return `${resistance / unit.divisor} ${unit.name}`;
}

export function resistanceWithUnit(colors: string[]): ResistorValue {
  if (colors.length < 3) {
    throw new Error("At least three colors are required");
  }

  const firstValue = COLOR_SEQUENCE.indexOf(colors[0]);
  const secondValue = COLOR_SEQUENCE.indexOf(colors[1]);
  const multiplierExp = COLOR_SEQUENCE.indexOf(colors[2]);

  if (firstValue === -1 || secondValue === -1 || multiplierExp === -1) {
    throw new Error("Invalid color");
  }

  const baseValue = Number(`${firstValue}${secondValue}`);
  const resistance = baseValue * Math.pow(10, multiplierExp);

  const unit = UNITS.find(u => multiplierExp >= u.threshold)!;

  return { resistance, unit };
}
