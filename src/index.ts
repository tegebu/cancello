import { Request, Response } from 'express';

export const hello = (_req: Request, res: Response): void => {
  res.send('Allô le monde');
};
