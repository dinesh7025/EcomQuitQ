using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.LoginRepository
{
    public interface ILoginRepository
    {
        Task<bool> ValidateLoginAsync(string usernameOrEmail, string password);
    }

}
