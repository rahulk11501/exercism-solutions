export const COLORS: string[] = [
      'black',
      'brown',
      'red',
      'orange',
      'yellow',
      'green',
      'blue',
      'violet',
      'grey',
      'white',
    ];

export function decodedValue(colors: string[]): number {
  let first: number = COLORS.indexOf(colors[0])
  let second: number = COLORS.indexOf(colors[1])
  
  return (first * 10) + second 
}
