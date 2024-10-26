const rgx = /\p{L}{1}\p{L}+/gu;

const createInitials = (name: string): string => {
  const matches = [...name.matchAll(rgx)];
  if (matches.length === 0) return "";

  const firstInitial = matches[0][0][0] || "";
  const lastInitial = matches[matches.length - 1][0][0] || "";

  return (firstInitial + lastInitial).toUpperCase();
};

export { createInitials };
