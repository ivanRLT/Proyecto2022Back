package com.amq.model;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


@Entity
public class PasswordResetToken {
	
	   private static final int EXPIRATION = 60 * 24;
	   
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private int id;
	 
	    private String token;
	 
	    @OneToOne(targetEntity = Usuario.class, fetch = FetchType.EAGER)
	    @JoinColumn(nullable = false, name = "user_id")
	    private Usuario usuario;
	 
	    private Date expiryDate;
	    
		public PasswordResetToken() {
			super();
			// TODO Auto-generated constructor stub
		}

//		public PasswordResetToken(String token, Usuario user) {
//			super();
//
//			this.token = token;
//			this.usuario = user;
//			
//			this.expiryDate = expiryDate;
//		}
	    public PasswordResetToken(final String token) {
	        super();

	        this.token = token;
	        this.expiryDate = calculateExpiryDate(EXPIRATION);
	    }

		public PasswordResetToken(final String token, final Usuario user) {
	        super();

	        this.token = token;
	        this.usuario = user;
	        this.expiryDate = calculateExpiryDate(EXPIRATION);
	    }

//		public PasswordResetToken(int id, String token, Usuario usuario, Date expiryDate) {
//			super();
//			this.id = id;
//			this.token = token;
//			this.usuario = usuario;
//			this.expiryDate = expiryDate;
//		}
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getToken() {
			return token;
		}

		public void setToken(String token) {
			this.token = token;
		}

		public Usuario getUsuario() {
			return usuario;
		}

		public void setUsuario(Usuario usuario) {
			this.usuario = usuario;
		}

		public Date getExpiryDate() {
			return expiryDate;
		}

		public void setExpiryDate(Date expiryDate) {
			this.expiryDate = expiryDate;
		}

		public static int getExpiration() {
			return EXPIRATION;
		}
		
		private Date calculateExpiryDate( int expiryTimeInMinutes) {
	        Calendar cal = Calendar.getInstance();
	        cal.setTimeInMillis(new Date().getTime());
	        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
	        return new Date(cal.getTime().getTime());
	    }

	    public void updateToken(final String token) {
	        this.token = token;
	        this.expiryDate = calculateExpiryDate(EXPIRATION);
	    }

		
		@Override
	    public int hashCode() {
	        final int prime = 31;
	        int result = 1;
	        result = prime * result + ((getExpiryDate() == null) ? 0 : getExpiryDate().hashCode());
	        result = prime * result + ((getToken() == null) ? 0 : getToken().hashCode());
	        result = prime * result + ((getUsuario() == null) ? 0 : getUsuario().hashCode());
	        return result;
	    }

		@Override
	    public boolean equals(final Object obj) {
	        if (this == obj) {
	            return true;
	        }
	        if (obj == null) {
	            return false;
	        }
	        if (getClass() != obj.getClass()) {
	            return false;
	        }
	        final PasswordResetToken other = (PasswordResetToken) obj;
	        if (getExpiryDate() == null) {
	            if (other.getExpiryDate() != null) {
	                return false;
	            }
	        } else if (!getExpiryDate().equals(other.getExpiryDate())) {
	            return false;
	        }
	        if (getToken() == null) {
	            if (other.getToken() != null) {
	                return false;
	            }
	        } else if (!getToken().equals(other.getToken())) {
	            return false;
	        }
	        if (getUsuario() == null) {
	            if (other.getUsuario() != null) {
	                return false;
	            }
	        } else if (!getUsuario().equals(other.getUsuario())) {
	            return false;
	        }
	        return true;
	    }
		@Override
	    public String toString() {
	        final StringBuilder builder = new StringBuilder();
	        builder.append("Token [String=").append(token).append("]").append("[Expires").append(expiryDate).append("]");
	        return builder.toString();
	    }


	    
	    
}
