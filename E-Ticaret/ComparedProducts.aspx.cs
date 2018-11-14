using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class ComparedProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;

            KarsilastirilacakUrunleriGetir(); // metodu altta ...
        }

        // ------------------------------------------------------
        // Ek : KarsilastirilacakUrunleriGetir(); içine bakın ...

        public List<Web.Library.Product> currentItems
        {
            set
            {
                ViewState["datas"] = value;
            }
            get
            {
                if (ViewState["datas"] == null)
                {
                    return new List<Web.Library.Product>();
                }
                else
                {
                    return (List<Web.Library.Product>)ViewState["datas"];
                }
            }
        }
        // ------------------------------------------------------

        private void KarsilastirilacakUrunleriGetir()
        {
            List<Web.Library.Product> listemiz = Web.Library.Compare.CompareTools.GetComparables(Session["myComparable"]);

            // -----------------------------
            // Ek'in işlenmesi ...
            //ViewState["datas"] = listemiz;
            // -----------------------------

            gwUrunKarsilastirma.DataSource = listemiz;
            gwUrunKarsilastirma.DataBind(); // unutmayın !!!
        }

        Web.Library.ORMETicaretDBDataContext db = new Web.Library.ORMETicaretDBDataContext();
        protected void lbtnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Web.Library.Product> currentItems = Web.Library.Compare.CompareTools.GetComparables(Session["myComparable"]);

            foreach (GridViewRow gw in gwUrunKarsilastirma.Rows) // GridViewRow olmasına ve CheckBox / HiddenField adlarının doğru olduğuna dikkat edin !!!
            {
                CheckBox chk = gw.FindControl("chkCheck") as CheckBox;

                if (chk.Checked) // veya == true
                {
                    int prodId = Convert.ToInt32((gw.FindControl("hfProductID") as HiddenField).Value);

                    Web.Library.Product kaldirilanUrun = currentItems.FirstOrDefault(x => x.ProductID == prodId);

                    currentItems.Remove(kaldirilanUrun);
                }
            }
            Session["myComparable"] = currentItems;

            // sayfayı tekrar kendine gönderme -> auto postBack özelliği gibi ...
            Response.Redirect(Page.Request.Url.ToString());
            // ------------------------------------
            KarsilastirilacakUrunleriGetir();
        }
    }
}