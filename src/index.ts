import { Request, Response } from 'express';

export const cancello = (_req: Request, res: Response): void => {
  res.send('Allô le monde');
};
