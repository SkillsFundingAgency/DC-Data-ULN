﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ESFA.DC.Data.ULN.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using ESFA.DC.Data.ULN.Model.Interfaces;
    
    public partial class ULN : DbContext, IULN
    {
        public ULN()
            : base("name=ULN")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<UniqueLearnerNumber> UniqueLearnerNumbers { get; set; }
    }
}
