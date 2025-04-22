using System.Diagnostics;
using Finanpro.Data;
using Finanpro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;
using BCrypt.Net;
namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly FinanproDbContext _context;
        public HomeController(ILogger<HomeController> logger, FinanproDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(UsuarioLoginViewModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            var usuario = _context.Usuarios
                .FirstOrDefault(u => u.Email == model.Email);

            if (usuario != null && BCrypt.Net.BCrypt.Verify(model.Contraseña, usuario.Contraseña))
            {
                HttpContext.Session.SetInt32("UsuarioId", usuario.Id);
                HttpContext.Session.SetString("UsuarioEmail", usuario.Email);

                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Correo o contraseña incorrectos.");
            return View(model);
        }

        public IActionResult Registrar()
        {
            return View(new Usuario());
        }

        [HttpPost]
        public IActionResult Registrar(Usuario usuario, string ConfirmarContraseña)
        {

            if (usuario.Contraseña != ConfirmarContraseña)
            {
                ViewData["ConfirmarContraseñaError"] = "Las contraseñas no coinciden.";
                return View(usuario);
            }


            if (_context.Usuarios.Any(u => u.Email == usuario.Email))
            {
                ModelState.AddModelError("Email", "El correo electrónico ya está registrado.");
                return View(usuario);
            }


            usuario.Contraseña = BCrypt.Net.BCrypt.HashPassword(usuario.Contraseña);


            _context.Usuarios.Add(usuario);
            _context.SaveChanges();


            return RedirectToAction("Login", "Usuario");
        }



    }
}
