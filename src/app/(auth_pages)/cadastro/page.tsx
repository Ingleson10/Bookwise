"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";

import { toast } from "@/components/hooks/use-toast";
import { Button } from "@/components/ui/button";
import { Form, FormControl, FormDescription, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { empresaSchema } from "@/components/utils/types/schemas";

export default function Teste() {

  const form = useForm<z.infer<typeof empresaSchema>>({
    resolver: zodResolver(empresaSchema),
    defaultValues: {
      AdmEmp: "admin",
      TelAdm: "123456789",
      CodEmp: 1,
      NomEmp: "Empresa",
      NomRam: "Ramo",
      CpfCnp: "12345678901",
      LogEnd: "Rua",
      NumEnd: 1,
      BaiEnd: "Bairro",
      CidEnd: "Cidade",
      EstEnd: "SP",
      TelEmp: "987654321",
      Endereco_CodCep: 12345678,
      TipEmp: "A",
    },
  });

  function onSubmit(data: z.infer<typeof empresaSchema>) {
    fetch("/api/auth/cademp", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    })
      .then(async (response) => {
        if (response.ok) {
          const result = await response.json();
          toast({
            title: "Sucesso!",
            description: "Empresa criada com sucesso.",
          });
        } else {
          const errorData = await response.json();
          toast({
            title: "Erro!",
            description: errorData.error,
          });
        }
      })
      .catch((error) => {
        toast({
          title: "Erro!",
          description: "Ocorreu um erro ao enviar os dados.",
        });
      });
  }

  return (
    <div className=" flex justify-center items-center">
      <Form {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)} className="w-2/3 space-y-6">
          <FormField
            control={form.control}
            name="AdmEmp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>AdmEmp</FormLabel>
                <FormControl>
                  <Input placeholder="AdmEmp" {...field} />
                </FormControl>
                <FormDescription>AdmEmp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="BaiEnd"
            render={({ field }) => (
              <FormItem>
                <FormLabel>BaiEnd</FormLabel>
                <FormControl>
                  <Input placeholder="BaiEnd" {...field} />
                </FormControl>
                <FormDescription>BaiEnd</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="CidEnd"
            render={({ field }) => (
              <FormItem>
                <FormLabel>CidEnd</FormLabel>
                <FormControl>
                  <Input  placeholder="CidEnd" {...field} />
                </FormControl>
                <FormDescription>CidEnd</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="CodEmp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>CodEmp</FormLabel>
                <FormControl>
                  <Input placeholder="CodEmp" {...field} />
                </FormControl>
                <FormDescription>CodEmp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="CpfCnp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>CpfCnp</FormLabel>
                <FormControl>
                  <Input placeholder="CpfCnp" {...field} />
                </FormControl>
                <FormDescription>CpfCnp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="Endereco_CodCep"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Endereco_CodCep</FormLabel>
                <FormControl>
                  <Input  placeholder="Endereco_CodCep" {...field} />
                </FormControl>
                <FormDescription>Endereco_CodCep</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="EstEnd"
            render={({ field }) => (
              <FormItem>
                <FormLabel>EstEnd</FormLabel>
                <FormControl>
                  <Input placeholder="EstEnd" {...field} />
                </FormControl>
                <FormDescription>EstEnd</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="LogEnd"
            render={({ field }) => (
              <FormItem>
                <FormLabel>LogEnd</FormLabel>
                <FormControl>
                  <Input placeholder="LogEnd" {...field} />
                </FormControl>
                <FormDescription>LogEnd</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="NomEmp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>NomEmp</FormLabel>
                <FormControl>
                  <Input placeholder="NomEmp" {...field} />
                </FormControl>
                <FormDescription>NomEmp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="NomRam"
            render={({ field }) => (
              <FormItem>
                <FormLabel>NomRam</FormLabel>
                <FormControl>
                  <Input placeholder="NomRam" {...field} />
                </FormControl>
                <FormDescription>NomRam</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="NumEnd"
            render={({ field }) => (
              <FormItem>
                <FormLabel>NumEnd</FormLabel>
                <FormControl>
                  <Input placeholder="NumEnd" {...field} />
                </FormControl>
                <FormDescription>NumEnd</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="TelAdm"
            render={({ field }) => (
              <FormItem>
                <FormLabel>TelAdm</FormLabel>
                <FormControl>
                  <Input placeholder="TelAdm" {...field} />
                </FormControl>
                <FormDescription>TelAdm</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="TelEmp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>TelEmp</FormLabel>
                <FormControl>
                  <Input placeholder="TelEmp" {...field} />
                </FormControl>
                <FormDescription>TelEmp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <FormField
            control={form.control}
            name="TipEmp"
            render={({ field }) => (
              <FormItem>
                <FormLabel>TipEmp</FormLabel>
                <FormControl>
                  <Input placeholder="TipEmp" {...field} />
                </FormControl>
                <FormDescription>TipEmp</FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />
          <Button type="submit">Submit</Button>
        </form>
      </Form>
    </div>
  );
}
