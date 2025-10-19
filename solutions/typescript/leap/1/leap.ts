export function isLeap(num: number): boolean {
  return (num % 400 === 0) || (num % 4 === 0 && num % 100 !== 0);
}
