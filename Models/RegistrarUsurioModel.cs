
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Finanpro.Data;


namespace Finanpro.Models
{
    public class RegistrarUsurioModel : PageModel
    {
        private readonly FinanproDbContext _context;

        
        public RegistrarUsurioModel(FinanproDbContext context)
        {
            _context = context;
        }


        [BindProperty]
        public string Nombre { get; set; }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Contraseña { get; set; }

        [BindProperty]
        public string ConfirmarContraseña { get; set; }

        public IActionResult OnPost()
        {

            if (Contraseña != ConfirmarContraseña)
            {
                ViewData["ConfirmarContraseñaError"] = "Las contraseñas no coinciden.";
                return Page();
            }

            // Verificar si el correo ya está registrado
            if (_context.Usuarios.Any(u => u.Email == Email))
            {
                ModelState.AddModelError("Email", "El correo electrónico ya está registrado.");
                return Page();
            }

            // Aui esta el error 
            var usuario = new Usuario
            {
                Nombre = Nombre,
                Email = Email,
                Contraseña = BCrypt.Net.BCrypt.HashPassword(Contraseña) // Hencripa
            };

            _context.Usuarios.Add(usuario);
            _context.SaveChanges();

            // Redirigir a la página de inicio o login
            return RedirectToPage("/Login");
        }
    }
}
