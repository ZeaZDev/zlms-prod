Imports DevExpress.Web.Data

Public Class UnitaMisura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '********************************************************
        '--- Controllo Autenticazione per accesso alla pagina ---
        If Not Session("Autenticato") Then
            'Response.Redirect("LoginUser.aspx")
        End If
        '********************************************************

    End Sub

    Private Sub ASPxGridView1_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow
        '--- titolo form edit in inserimento
        ASPxGridView1.SettingsText.PopupEditFormCaption = "Nuova Unità di Misura"

    End Sub

    Private Sub ASPxGridView1_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        '----------------------------------------------------------------
        '--- aggiorna i dati in fase di inserimento di una nuova riga ---
        '----------------------------------------------------------------
        Dim xDateTime = DateTime.Now
        e.NewValues("Ins_DataOra") = xDateTime
        e.NewValues("Upd_DataOra") = xDateTime
        e.NewValues("Ins_Utente") = Session("sUtente_UserName")       '--- mettere la variabile di sessione
        e.NewValues("Upd_Utente") = Session("sUtente_UserName")        '--- mettere la variabile di sessione
        e.NewValues("LivelloAutorizzazione") = Session("sUtente_Livello")    '--- mettere la variabile di sessione

    End Sub

    Private Sub ASPxGridView1_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        '----------------------------------------------------------------
        '--- aggiorna i dati in fase di inserimento di una nuova riga ---
        '----------------------------------------------------------------
        Dim xDateTime = DateTime.Now
        e.NewValues("Upd_DataOra") = xDateTime
        e.NewValues("Upd_Utente") = Session("sUtente_UserName")        '--- mettere la variabile di sessione

    End Sub

    Private Sub ASPxGridView1_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

        '--- titolo form edit in modifica
        ASPxGridView1.SettingsText.PopupEditFormCaption = "Modifica Unita di Misura"

    End Sub
End Class