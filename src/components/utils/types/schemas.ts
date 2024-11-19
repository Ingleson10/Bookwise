
import { z } from 'zod';

const empresaSchema = z.object({
  CodEmp: z.number().int().optional(),
  NomEmp: z.string().max(100),
  NomRam: z.string().max(100).optional(),
  CpfCnp: z.string().max(14),
  LogEnd: z.string().max(100).optional(),
  NumEnd: z.number().int().optional(),
  BaiEnd: z.string().max(45).optional(),
  CidEnd: z.string().max(45).optional(),
  EstEnd: z.string().max(2).optional(),
  TelEmp: z.string().max(15),
  AdmEmp: z.string().max(45),
  TelAdm: z.string().max(15).optional(),
  Endereco_CodCep: z.number().int(),
  TipEmp: z.string().max(1).optional(),
});

export { empresaSchema };