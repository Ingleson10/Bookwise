import Link from "next/link";

function Navbar() {
  return (
    <nav className="bg-background p-4">
      <div className="container mx-auto flex justify-between items-center">
        <div className=" text-lg font-bold">Bookwise</div>
        <div className="space-x-4">
          <Link className=" hover:underline" href="/cadastro">
            Registro
          </Link>
          <Link className=" hover:underline" href="/login">
            Login
          </Link>
        </div>
      </div>
    </nav>
  );
}

export default function Page() {
  return (
    <div>
      <Navbar />
      <div className="container mx-auto mt-4">Página inicial Bookwise</div>
    </div>
  );
}
