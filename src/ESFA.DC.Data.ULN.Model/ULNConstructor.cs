namespace ESFA.DC.Data.ULN.Model
{
    public partial class ULN
    {
        public ULN(string connectionString)
            : base(connectionString)
        {
            this.Database.CommandTimeout = 180;
        }
    }
}
